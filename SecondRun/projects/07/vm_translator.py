from collections import namedtuple
from enum import Enum
from typing import List, Generator
import re

# Each command named tuple stores 1 line of vm code.
Command = namedtuple('Command', 'command_type arg1 arg2', defaults=[None, None])

ARITHMETIC_COMMANDS = {'add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not'}


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
        input_vm_file: the file location of a .vm file to be compiled.
    """

    def __init__(self, input_vm_file: str):
        self.input_file = input_vm_file
        self.output_file = input_vm_file.split('.')[0] + '.asm'

    def compile(self):
        """Compile the input .vm file into the hack assembly code and
        save it as a .asm file with the same name."""
        commands = self._parse_file()
        self._write_file(commands)

    def _parse_file(self):
        """Create a parser which will parse lines in the vm file and return a
        list of the command named tuples."""
        parser = Parser(self.input_file)
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

    def _parse_row(self, row: str):
        """Parse an individual row and return a command named tuple containing
        its instructions."""
        row = self._remove_comments_and_whitespace(row)

        # if row doesn't contain a command, return None
        if not row:
            return

        command, *args = row.split(' ')

        if command.lower() in ARITHMETIC_COMMANDS:
            return Command(CommandType.ARITHMETIC, command)
        elif command.lower() == "push":
            return Command(CommandType.PUSH, args[0], int(args[1]))
        elif command.lower() == "pop":
            return Command(CommandType.POP, args[0], int(args[1]))
        else:
            raise NotImplementedError(f"Parser handling for {command!r} not yet implemented.")

    def _remove_comments_and_whitespace(self, row: str) -> str:
        """Remove any outer white space, remove comments, and reduce
         inner whitespace to one space."""
        row = re.sub(r'\s+', ' ', row).strip()
        row = re.sub(r'\/\/+.*', '', row).strip()
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
        self.asm_commands: List[str] = ['// Compiled using vm_translator.py\n', ]
        self.logic_counts = {'eq': 0, 'gt': 0, 'lt': 0}

    def write_and_save(self):
        self.parse_commands()
        self.save_output()

    def parse_commands(self):
        for command in self.commands:
            c = self.parse_command(command) + '\n'
            self.asm_commands.append(c)

    def save_output(self):
        with open(self.output_file, 'w') as file:
            for asm_command in self.asm_commands:
                if asm_command is None:
                    continue
                file.write(asm_command)
        print(f'Saved file as {self.output_file!r}')

    def parse_command(self, command) -> str:
        if command.command_type == CommandType.ARITHMETIC:
            return self.arithmetic_parser(command)
        elif command.command_type == CommandType.PUSH:
            return self.push_parser(command)
        elif command.command_type == CommandType.POP:
            return self.pop_parser(command)
        elif command.command_type == CommandType.LABEL:
            return self.label_parser(command)
        elif command.command_type == CommandType.IF:
            return self.if_parser(command)
        elif command.command_type == CommandType.FUNCTION:
            return self.function_parser(command)
        elif command.command_type == CommandType.RETURN:
            return self.return_parser(command)
        elif command.command_type == CommandType.CALL:
            return self.call_parser(command)
        else:
            raise ValueError(f'{command.command_type!r} is an invalid command')

    ### COMMAND PARSERS
    def arithmetic_parser(self, command: Command) -> str:
        if command.arg1 in ARITHMETIC_CODE:
            return f'// {command.arg1}\n' + ARITHMETIC_CODE[command.arg1]
        elif command.arg1 in LOGICAL_CODE:
            return f'// {command.arg1}\n' + LOGICAL_CODE[command.arg1]
        else:
            return f'// {command.arg1}\n' + self.comparison(command)

    def push_parser(self, command: Command) -> str:
        output = []
        output.append(f'// push {command.arg1} {command.arg2}')
        # output.append(self.set_d_to_value_at_address(command.arg1, command.arg2))
        output.append(self.access_segment_address(command.arg1, command.arg2))
        if command.arg1 == "constant":
            output.append('D=A')
        else:
            output.append('D=M')
        output.append('')
        output.append(self.push_d_to_stack())
        output.append('')
        return '\n'.join(output)

    def pop_parser(self, command: Command) -> str:
        output = []
        output.append(f'// pop {command.arg1} {command.arg2}')
        output.append(self.pop_d_from_stack())
        output.append('')
        output.append(self.access_segment_address(command.arg1, command.arg2))
        output.append('M=D')
        output.append('')
        return '\n'.join(output)

    def label_parser(self, command: Command) -> str:
        pass

    def if_parser(self, command: Command) -> str:
        pass

    def function_parser(self, command: Command) -> str:
        pass

    def return_parser(self, command: Command) -> str:
        pass

    def call_parser(self, command: Command) -> str:
        pass

    def access_segment_address(self, segment: str, index: int) -> str:
        """Set D to the value at the address"""
        if segment == 'static':
            # TODO: static should be module name.
            return f'@static.{index}'
        elif segment == 'constant':
            return f'@{index}'
        elif segment == 'pointer':
            return f'@{index + 3}'
        elif segment == 'temp':
            return f'@{index + 5}'
        else:
            return self.access_segment_address_from_pointer(segment, index)

    def access_segment_address_from_pointer(self, segment: str, index: int) -> str:
        """Set A to the address of the segment index."""
        target = segment_dict[segment]
        output = [f'@{target}']
        if index == 0:
            output.append('A=M')
        else:
            output.append('A=M+1')
            for _ in range(index - 1):
                output.append('A=A+1')
        return '\n'.join(output)

    def comparison(self, command: Command) -> str:
        """Generate code for a stack logical comparison"""
        self.logic_counts[command.arg1] += 1
        count = self.logic_counts[command.arg1]
        arg = command.arg1.upper()
        return '\n'.join(['@SP', 'M=M-1', '', '@SP', 'A=M', 'D=M',
                          '@SP', 'A=M-1', 'D=M-D', 'M=1',
                          f'@END_{arg}_{count}', f'D; J{arg}', '', '@SP',
                          'A=M-1', 'M=0', '', f'(END_{arg}_{count})', ''])

    # 
    # def set_d_to_value_at_segment(self, segment: str, index: int) -> str:
    #     """Set d to value at segment."""
    #     target = segment_dict[segment]
    #     output = [f'@{target}']
    #     if index == 0:
    #         output.append('A=M')
    #     else:
    #         output.append('A=M+1')
    #         for _ in range(index - 1):
    #             output.append('A=A+1')
    #     output.append('D=M')
    #     return '\n'.join(output)

    # STACK
    def push_d_to_stack(self) -> str:
        """Push the current value in the D slot to the top of the stack."""
        return '\n'.join(['@SP', 'M=M+1', 'A=M-1', 'M=D'])

    def pop_d_from_stack(self) -> str:
        """Pop the stack to D."""
        return '\n'.join(['@SP', 'M=M-1', 'A=M', 'D=M'])


ARITHMETIC_CODE = {'add': '\n'.join(['@SP', 'M=M-1', 'A=M', 'D=M',
                                     '', '@SP', 'A=M-1', 'M=M+D']),
                   'sub': '\n'.join(['@SP', 'M=M-1', '', '@SP',
                                     'A=M', 'D=M', '', '@SP', 'A=M-1', 'M=M-D'])}

LOGICAL_CODE = {'neg': '\n'.join(['@SP', 'A=M-1', 'M=-M']),
                'not': '\n'.join(['@SP', 'A=M-1', 'A=!M']),
                'and': '\n'.join(['@SP', 'M=M-1', 'A=M', 'D=M', 'A=A-1', 'M=D&M']),
                'or': '\n'.join(['@SP', 'M=M-1', 'A=M', 'D=M', 'A=A-1', 'M=D|M'])}


def test():
    cmd = Command(CommandType.ARITHMETIC, 'add', None)
    writer = Writer(None, None)
    print(writer.parse_command(cmd))


def main():
    # file = 'MemoryAccess\\BasicTest\\BasicTest.vm'
    # file = 'MemoryAccess\\StaticTest\\StaticTest.vm'
    # file = 'MemoryAccess\\PointerTest\\PointerTest.vm'
    # file = 'MemoryAccess\\Playground\\Playground.vm'
    # file = 'StackArithmetic\\SimpleAdd\\SimpleAdd.vm'
    file = 'StackArithmetic\\StackTest\\StackTest.vm'
    translator = VMTranslator(file)
    translator.compile()


if __name__ == '__main__':
    main()
    # test()
