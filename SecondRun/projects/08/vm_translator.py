from collections import namedtuple
from enum import Enum
import os
from typing import List, Generator, Optional, TextIO
import re

# Each command named tuple stores 1 line of vm code.
Command = namedtuple('Command', 'command_type arg1 arg2 vm_code')

ARITHMETIC_COMMANDS = {'add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or',
                       'not'}


class CommandType(Enum):
    ARITHMETIC = 1
    PUSH = 2
    POP = 3
    LABEL = 4
    GOTO = 5
    IF = 6
    FUNCTION = 7
    RETURN = 8
    CALL = 9


segment_dict = dict(SP='SP',
                    local='LCL',
                    argument='ARG',
                    this='THIS',
                    that='THAT',
                    pointer='POINTER',
                    temp='TEMP')


class VMTranslator:
    """Handles instantiating the parser and writer classes and transferring
    information between the two.
    
    Args:
        vm_program: the location of a .vm file or directory to be compiled.
    """

    def __init__(self, vm_program: str):
        self.input_program = vm_program
        self.output_file = ''

    def compile(self):
        """Compile the input .vm file into the hack assembly code and
        save it as a .asm file with the same name."""
        if '.vm' in self.input_program:
            self.output_file = self.input_program.split('.')[0] + '.asm'
            commands = self._parse_file(self.input_program)
        else:
            self.output_file = os.path.join(self.input_program.split('.')[0],
                                            self.input_program.split('\\')[
                                                -1] + '.asm')
            commands = self._parse_directory()
        self._write_file(commands)

    def _parse_directory(self) -> List[Command]:
        """Compile all the .vm files within the directory nto the hack assembly
        code and save it as a .asm file with the same name."""
        files = [os.path.join(self.input_program, file)
                 for file in os.listdir(self.input_program)
                 if '.vm' in file]
        commands_lists = [self._parse_file(file) for file in files]

        # Flatten command lists
        return [command for commands in commands_lists for command in commands]

    def _parse_file(self, file: str) -> List[Command]:
        """Create a parser which will parse lines in the vm file and return a
        list of the command named tuples."""
        parser = Parser(file)
        return parser.commands

    def _write_file(self, commands: List[Command]):
        """Create a writer which will convert the commands to asm code and save
        the output file."""
        writer = Writer(commands, self.output_file)
        writer.write_and_save()


class Parser:
    """Parses a .vm file and reduces it to a list of commands.
    
    Args:
        input_file: location of .vm file to be compiled.
    """

    def __init__(self, input_file: str):
        self.input_file = input_file
        self.reader: Generator = self._open_file()
        self.commands: List[Command] = []
        self._parse_rows()

    def _open_file(self):
        """Generator which opens the file and yields each line."""
        with open(self.input_file, 'r') as file:
            yield from file

    def _parse_rows(self):
        """Parse each row and append any commands in a row to
        the command list."""
        for row in self.reader:
            if command := self._parse_row(str(row)):
                self.commands.append(command)

    def _parse_row(self, row: str) -> Optional[Command]:
        """Parse an individual row and return a command named tuple containing
        its instructions."""
        row = self._remove_comments_and_whitespace(row)

        # if row doesn't contain a command, return None
        if not row:
            return

        command, *args = row.split(' ')

        if command.lower() in ARITHMETIC_COMMANDS:
            return Command(CommandType.ARITHMETIC, command, None, row)
        elif command.lower() == "push":
            return Command(CommandType.PUSH, args[0], int(args[1]), row)
        elif command.lower() == "pop":
            return Command(CommandType.POP, args[0], int(args[1]), row)
        elif command.lower() == "label":
            return Command(CommandType.LABEL, args[0], None, row)
        elif command.lower() == "goto":
            return Command(CommandType.GOTO, args[0], None, row)
        elif command.lower() == "if-goto":
            return Command(CommandType.IF, args[0], None, row)
        elif command.lower() == "function":
            return Command(CommandType.FUNCTION, args[0], int(args[1]), row)
        elif command.lower() == "return":
            return Command(CommandType.RETURN, None, None, row)
        elif command.lower() == "call":
            return Command(CommandType.CALL, args[0], int(args[1]), row)
        else:
            raise NotImplementedError(
                f"Parser handling for {command!r} not yet implemented.")

    def _remove_comments_and_whitespace(self, row: str) -> str:
        """Remove any outer white space, remove comments, and reduce
         inner whitespace to one space."""
        row = re.sub(r'\s+', ' ', row).strip()
        # row = re.sub(r'\/\/+.*', '', row).strip()
        row = re.sub(r'//+.*', '', row).strip()
        return row


class Writer:
    """Converts vm commands to assembly language and outputs a file.
    
    Args:
        commands: List of command named tuples to be compiled.
        output_file: asm file name to save the compiled code as.
    """

    def __init__(self, commands: List[Command], output_file: str):
        self.commands = commands
        self.output_file = output_file
        self.label_counts = {'eq': 0, 'gt': 0, 'lt': 0, 'call': 0}
        self.asm_commands: List[str] = []
        self.add_bootstrap()

    def add_bootstrap(self):
        """Add the boostrap code ot the top of the file."""
        self.write('// Compiled using vm_translator.py',
                   '',
                   '// <------------- START BOOTSTRAP ------------->',
                   '',
                   '@256',
                   'D=A',
                   '',
                   '@SP',
                   'M=D',
                   '')
        # self.write_call(Command(CommandType.CALL, 'Sys.init', 0,
        # 'BOOTSTRAP'))
        self.write('', '// <------------- END BOOTSTRAP ------------->', '')

    def write(self, *lines: str):
        """Add asm command lines to the asm_commands list which will be written
        to the file at the end."""
        for line in lines:
            self.asm_commands.append(line)

    def write_and_save(self):
        """Write all the asm command lines and save the output file."""
        self.parse_commands()
        self.save_output()

    def parse_commands(self):
        """Parse each command provided by the parser."""
        for command in self.commands:
            # print(command)
            self.parse_command(command)

    def save_output(self):
        """Save the output asm commands as an asm file."""
        print(self.asm_commands)
        with open(self.output_file, 'w') as file:
            for asm_command in self.asm_commands:
                if asm_command is None:
                    continue
                file.write(asm_command + '\n')
        print(f'Saved file as {self.output_file!r}')

    def parse_command(self, command):
        """Determine the command type and then call the proper write method."""
        self.write(f'// {command.vm_code}')
        if command.command_type == CommandType.ARITHMETIC:
            self.write_arithmetic(command)
        elif command.command_type == CommandType.PUSH:
            self.write_push(command)
        elif command.command_type == CommandType.POP:
            self.write_pop(command)
        elif command.command_type == CommandType.LABEL:
            self.write_label(command)
        elif command.command_type == CommandType.GOTO:
            self.write_goto(command)
        elif command.command_type == CommandType.IF:
            self.write_if(command)
        elif command.command_type == CommandType.FUNCTION:
            self.write_function(command)
        elif command.command_type == CommandType.RETURN:
            self.write_return(command)
        elif command.command_type == CommandType.CALL:
            self.write_call(command)
        else:
            raise ValueError(f'{command.command_type!r} is an invalid command')

    # COMMAND PARSERS
    def write_arithmetic(self, command: Command):
        """Write an arithmetic command to the file."""
        if command.arg1 in ARITHMETIC_CODE:
            self.write(ARITHMETIC_CODE[command.arg1])
        elif command.arg1 in LOGICAL_CODE:
            self.write(LOGICAL_CODE[command.arg1])
        else:
            self._write_comparison(command)

    def write_push(self, command: Command):
        """Write a push command to the file."""
        self._write_access_segment_address(command.arg1, command.arg2)
        if command.arg1 == "constant":
            self.write('D=A')
        else:
            self.write('D=M')
        self._write_push_d_to_stack()

    def write_pop(self, command: Command):
        """Write a pop command to the file."""
        self._write_pop_d_from_stack()
        self._write_access_segment_address(command.arg1, command.arg2)
        self.write('M=D')

    def write_label(self, command: Command):
        """Write a label to the file."""
        self.write(f'({command.arg1})')

    def write_goto(self, command: Command):
        self.write(f'@{command.arg1}',
                   '0;JMP')

    def write_if(self, command: Command):
        """Write an if command to the file."""
        self.write('@SP',
                   'M=M-1',
                   'A=M',
                   'D=M',
                   f'@{command.arg1}',
                   'D;JGT')

    def write_function(self, command: Command):
        """Write a function command to the file."""
        self.write(f'({command.arg1})')
        self._write_push_0_to_stack(command.arg2)

    def write_return(self, command: Command):
        """Write a return command to the file."""
        # endFrame = LCL
        self.write('@LCL',
                   'D=M',
                   '',
                   '@endFrame',
                   'M=D',
                   '')
        # retAddress = *(endFrame - 5)
        self.write('@LCL',
                   'D=M-1',
                   'D=D-1',
                   'D=D-1',
                   'D=D-1',
                   'D=D-1',
                   'A=D',
                   'D=M',
                   '',
                   '@retAddress',
                   'M=D',
                   '')
        # *ARG = pop()
        self._write_pop_d_from_stack()
        self.write('@ARG',
                   'A=M',
                   'M=D')
        # SP = ARG + 1
        self.write('@ARG',
                   'D=M+1',
                   '',
                   '@SP',
                   'M=D')
        # THAT = *(endFrame - 1)
        self.write('@endFrame',
                   'A=M-1',
                   'D=M',
                   '',
                   '@THAT',
                   'M=D',
                   '')
        # THIS = *(endFrame - 2)
        self.write('@endFrame',
                   'D=M-1',
                   'A=D-1',
                   'D=M',
                   '',
                   '@THIS',
                   'M=D',
                   '')
        # ARG = *(endFrame - 3)
        self.write('@endFrame',
                   'D=M-1',
                   'D=D-1',
                   'A=D-1',
                   'D=M',
                   '',
                   '@ARG',
                   'M=D',
                   '')
        # LCL = *(endFrame - 4)
        self.write('@endFrame',
                   'D=M-1',
                   'D=D-1',
                   'D=D-1',
                   'A=D-1',
                   'D=M',
                   '',
                   '@LCL',
                   'M=D',
                   '')
        # Goto retAddress
        self.write('@retAddress',
                   'A=M',
                   '0;JMP')

    def write_call(self, command: Command):
        """Write call command to file."""
        self.label_counts['call'] += 1

        # skip over nArgs that were pushed by the caller
        # self._write_increase_sp_n_times(command.arg2)

        # Push returnAddress
        self.write(f'@RETURN_ADDRESS_CALL_{self.label_counts["call"]}',
                   'D=A')
        self._write_push_d_to_stack()
        # --SAVE THESE--
        # Push LCL
        self.write('@LCL',
                   'D=M')
        self._write_push_d_to_stack()
        # Push ARG
        self.write('@ARG',
                   'D=M')
        self._write_push_d_to_stack()
        # Push THIS
        self.write('@THIS',
                   'D=M')
        self._write_push_d_to_stack()
        # Push THAT
        self.write('@THAT',
                   'D=M')
        self._write_push_d_to_stack()
        # ARG = SP-5-nArgs
        self.write('@SP',
                   'D=M')
        self._write_decrease_d_n_times(5 + command.arg2)
        self.write('@ARG',
                   'M=D')
        # --------------
        # LCL = SP
        self.write('@SP',
                   'D=M',
                   '',
                   '@LCL',
                   'M=D')
        # goto Function
        # TODO: THIS IS NOT RIGHT
        self.write(f'@{command.arg1}',
                   '0;JMP')
        # Declare (returnAddress)
        self.write(f'(RETURN_ADDRESS_CALL_{self.label_counts["call"]})')

    def _write_access_segment_address(self, segment: str, index: int):
        """Set D to the value at the address"""
        if segment == 'static':
            # TODO: static should be module name.
            self.write(f'@static.{index}')
        elif segment == 'constant':
            self.write(f'@{index}')
        elif segment == 'pointer':
            self.write(f'@{index + 3}')
        elif segment == 'temp':
            self.write(f'@{index + 5}')
        else:
            return self._write_access_segment_address_from_pointer(segment,
                                                                   index)

    def _write_access_segment_address_from_pointer(self, segment: str,
                                                   index: int):
        """Set A to the address of the segment index."""
        target = segment_dict[segment]
        self.write(f'@{target}')
        if index == 0:
            self.write('A=M')
        else:
            self.write('A=M+1')
            for _ in range(index - 1):
                self.write('A=A+1')

    def _write_comparison(self, command: Command):
        """Generate code for a stack logical comparison"""
        self.label_counts[command.arg1] += 1
        count = self.label_counts[command.arg1]
        arg = command.arg1.upper()
        self.write('@SP',
                   'M=M-1',
                   '',
                   '@SP',
                   'A=M',
                   'D=M',
                   '@SP',
                   'A=M-1',
                   'D=M-D',
                   'M=-1',
                   f'@END_{arg}_{count}',
                   f'D; J{arg}',
                   '',
                   '@SP',
                   'A=M-1', 'M=0',
                   '',
                   f'(END_{arg}_{count})',
                   '')

    def _write_increase_sp_n_times(self, n: int):
        """Increase the pointer by n. This is used for skipping nArgs."""
        if n == 0:
            return
        self.write('@SP')
        for _ in range(n):
            self.write('M=M+1')

    def _write_decrease_d_n_times(self, n: int):
        """Decrease the value in the D memory n times."""
        for _ in range(n):
            self.write('D=D-1')

    # STACK
    def _write_push_d_to_stack(self):
        """Push the current value in the D slot to the top of the stack."""
        self.write('@SP',
                   'M=M+1',
                   'A=M-1',
                   'M=D',
                   '')

    def _write_pop_d_from_stack(self):
        """Pop the stack to D."""
        self.write('@SP',
                   'M=M-1',
                   'A=M',
                   'D=M',
                   '')

    def _write_push_0_to_stack(self, n: int):
        """Push 0 to stock n times."""
        for _ in range(n):
            self.write('@SP',
                       'M=M+1',
                       'A=M-1',
                       'M=0',
                       '')


ARITHMETIC_CODE = {'add': '\n'.join(['@SP',
                                     'M=M-1',
                                     'A=M',
                                     'D=M',
                                     '',
                                     '@SP',
                                     'A=M-1',
                                     'M=M+D']),
                   'sub': '\n'.join(['@SP',
                                     'M=M-1',
                                     '',
                                     '@SP',
                                     'A=M',
                                     'D=M',
                                     '',
                                     '@SP',
                                     'A=M-1',
                                     'M=M-D'])}

LOGICAL_CODE = {'neg': '\n'.join(['@SP',
                                  'A=M-1',
                                  'M=-M']),
                'not': '\n'.join(['@SP',
                                  'A=M-1',
                                  'M=!M']),
                'and': '\n'.join(['@SP',
                                  'M=M-1',
                                  'A=M',
                                  'D=M',
                                  'A=A-1',
                                  'M=D&M']),
                'or': '\n'.join(['@SP',
                                 'M=M-1',
                                 'A=M',
                                 'D=M',
                                 'A=A-1',
                                 'M=D|M'])}


def main():
    """Translate and save the files."""
    files = [
        # 'ProgramFlow\\BasicLoop',
        #  'ProgramFlow\\FibonacciSeries',
        #  'FunctionCalls\\SimpleFunction',
         'FunctionCalls\\NestedCall',
         # 'FunctionCalls\\StaticsTest',
         # 'FunctionCalls\\FibonacciElement'
             ]
    for file in files:
        translator = VMTranslator(file)
        translator.compile()


if __name__ == '__main__':
    main()
