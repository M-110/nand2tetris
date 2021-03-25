from collections import namedtuple
from enum import Enum
from typing import List
import re

Command = namedtuple('Command', 'command_type arg1 arg2', defaults=[None, None])

ARITHMETIC_COMMANDS = {'add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not'}

class VMTranslater:
    """Handles instantiating the parser and writer files."""
    def __init__(self, input_file: str, output_file: str):
        self.input_file = input_file
        self.output_file = output_file
        
    def parse_file(self, input_file):
        """Create a parser to extract commands."""
        pass


class Parser:
    """Parses a .vm file and reduces it to a list of commands."""

    def __init__(self, input_file: str):
        self.input_file = input_file
        self.reader = self.open_file()
        self.commands: List[Command] = []
        self.parse_rows()
        print(self.commands)

    def open_file(self):
        """Open file as a generator."""
        with open(self.input_file, 'r') as file:
            yield from file

    def parse_rows(self):
        """Parse each row and append any commands in a row to
        the main command list."""
        for row in self.reader:
            command = self.parse_row(row)
            if command is not None:
                self.commands.append(command)
    
    def parse_row(self, row: str):
        """Parse an individual row and turn it into a command."""
        row = self.remove_comments_and_whitespace(row)
        if not row:
            return

        command, *args = row.split(' ')

        if command.lower() in ARITHMETIC_COMMANDS:
            return Command(CommandType.ARITHMETIC, command)
        elif command.lower() == "push":
            return Command(CommandType.PUSH, args[0], args[1])
        elif command.lower() == "pop":
            return Command(CommandType.POP, args[0], args[1])
        else:
            raise NotImplementedError(f"Parser handling for {command!r} not yet implimented.")
    
    def remove_comments_and_whitespace(self, row: str) -> str:
        """Remove any outer white space, remove comments, and reduce
         inner whitespace to one space."""
        # Remove outer whitespace and reduce all inner spaces to 1.
        row = re.sub(r'\s+', ' ', row).strip()
        row = re.sub(r'\/\/+.*', '', row).strip()
        return row


class Writer:
    """Converts vm commands to assembly language and outputs a file."""
    def __init__(self, commands: List[Command], output_file: str):
        self.commands = commands
        self.output_file = output_file
        self.asm_commands: List[str] = []

    def parse_commands(self):
        for command in self.commands:
            self.parse_command(command)

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

    def arithmetic_parser(self, command: Command) -> str:
        pass

    def push_parser(self, command: Command) -> str:
        pass

    def pop_parser(self, command: Command) -> str:
        pass

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

def main():
    file='BasicTest.vm'
    parser = Parser(file)

if __name__ == '__main__':
    main()
        