#!/usr/bin/env python
import sys
import os

# region tables
COMP_DICT = {
    '0': '0101010',
    '1': '0111111',
    '-1': '0111010',
    'D': '0001100',
    'A': '0110000',
    '!D': '001101',
    '!A': '0110001',
    '-D': '0001111',
    '-A': '0110011',
    'D+1': '0011111',
    'A+1': '0110111',
    'D-1': '0001110',
    'A-1': '0110010',
    'D+A': '0000010',
    'D-A': '0010011',
    'A-D': '0000111',
    'D&A': '0000000',
    'D|A': '0010101',
    'M': '1110000',
    '!M': '1110001',
    '-M': '1110011',
    'M+1': '1110111',
    'M-1': '1110010',
    'D+M': '1000010',
    'D-M': '1010011',
    'M-D': '1000111',
    'D&M': '1000000',
    'D|M': '1010101',
}

DEST_DICT = {
    'null': '000',
    'M': '001',
    'D': '010',
    'MD': '011',
    'A': '100',
    'AM': '101',
    'AD': '110',
    'AMD': '111',
}

JUMP_DICT = {
    'null': '000',
    'JGT': '001',
    'JEQ': '010',
    'JGE': '011',
    'JLT': '100',
    'JNE': '101',
    'JLE': '110',
    'JMP': '111',
}

symbol_table = {
    'SP': '0',
    'LCL': '1',
    'ARG': '2',
    'THIS': '3',
    'THAT': '4',
    'R0': '0',
    'R1': '1',
    'R2': '2',
    'R3': '3',
    'R4': '4',
    'R5': '5',
    'R6': '6',
    'R7': '7',
    'R8': '8',
    'R9': '9',
    'R10': '10',
    'R11': '11',
    'R12': '12',
    'R13': '13',
    'R14': '14',
    'R15': '15',
    'SCREEN': '16384',
    'KBD': '24576',
}


# endregion


def assemble_code():
    file_name = get_file_name()
    code_lines = readlines_file(file_name)
    code_lines = clear_comments(code_lines)
    code_lines = clear_white_space(code_lines)
    code_lines = location_symbol_pass(code_lines)
    code_lines = variable_symbol_pass(code_lines)
    code_lines = to_binary_pass(code_lines)
    write_to_file(code_lines, file_name)


def get_file_name() -> str:
    if len(sys.argv) < 2:
        raise ValueError('Please include a file name to convert.')
    if not sys.argv[1].endswith('.asm'):
        raise ValueError('File must be an \'.asm\' file')
    script_dir = os.path.dirname(__file__)
    return os.path.join(script_dir, sys.argv[1])


def readlines_file(file_name: str) -> list:
    with open(file_name) as file_contents:
        return file_contents.read().split('\n')


def clear_comments(code_lines: list) -> list:
    return [line[:line.find('//')] if '//' in line else line
            for line in code_lines]


def clear_white_space(code_lines: list) -> list:
    code_lines = [line.replace(' ', '') for line in code_lines]
    return [line for line in code_lines if line]


def location_symbol_pass(code_lines: list) -> list:
    new_code_lines = []
    for line in code_lines:
        if line.startswith('('):
            line = line.replace('(', '').replace(')', '')
            symbol_table[line] = str(len(new_code_lines))
        else:
            new_code_lines.append(line)
    return new_code_lines


def variable_symbol_pass(code_lines: list) -> list:
    new_code_lines = []
    symbol_count = 16
    for line in code_lines:
        if line.startswith('@'):
            if line[1:].isnumeric():
                new_code_lines.append(line)
            elif line[1:] in symbol_table:
                new_code_lines.append('@' + symbol_table[line[1:]])
            else:
                symbol_table[line[1:]] = str(symbol_count)
                new_code_lines.append('@' + str(symbol_count))
                symbol_count += 1
        else:
            new_code_lines.append(line)
    return new_code_lines


def to_binary_pass(code_lines: list) -> list:
    output = []
    for line in code_lines:
        if line[0] == '@':
            output.append(a_to_binary(line))
        else:
            output.append(c_to_binary(line.upper()))
    return output


def a_to_binary(line: str) -> str:
    return '0' + binary_converter(int(line[1:])).rjust(15, '0')


def binary_converter(num: int) -> str:
    if num > 1:
        return str(binary_converter(num // 2)) + str(num % 2)
    return str(num)


def c_to_binary(line: str) -> str:
    c_command = '111'
    dest = '000'
    jump = '000'
    if '=' in line:
        dest = DEST_DICT[line[:line.find('=')]]
    if ';' in line:
        jump = JUMP_DICT[line[line.find(';') + 1:]]
    comp = get_comp(line)

    return c_command + comp + dest + jump


def get_comp(line: str) -> str:
    if '=' in line:
        line = line[line.find('=') + 1:]
    if ';' in line:
        line = line[:line.find(';')]
    return COMP_DICT[line]


def write_to_file(code_lines: list, file_name: str):
    output_name = file_name.replace('.asm', '.hack')
    with open(output_name, 'w') as output_file:
        output_file.write('\n'.join(code_lines))
    print(f'Saved to {output_name}')


assemble_code()
