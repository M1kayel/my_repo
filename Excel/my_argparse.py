import xlsxwriter
import argparse
import os

def create_workbook(output_file):
    return xlsxwriter.Workbook(output_file)

def create_worksheet(workbook, headers):
    sheet = workbook.add_worksheet()
    for i, header in enumerate(headers):
        sheet.write(0,i,header)
    return sheet

def check_file_existence(fname):
    if not os.path.isfile(fname):
        print("Input file",fname," does not exist: Please check")
        exit(0)
def read_data(files):
    with open(files,'r') as file:
        lines = file.readlines()
    return lines

def write_data(workbook,sheet,lines):
    bold = workbook.add_format({'bold': True})
    age = workbook.add_format({'bg_color':'#008000'})
    for row_i, line in enumerate(lines):
        col = line.split()
        for col_i,value in enumerate(col):
            if col_i == 2 and int(value) > 30:
                sheet.write(row_i+1,col_i,value,age)
            else:
                sheet.write(row_i+1,col_i,value,bold)

def sort_data(lines,sorting):
    if sorting != -1:
        return sorted(lines, key=lambda line: line.split()[sorting])
    else:
        return lines

def apply_header_color(workbook,sheet,headers,sorting):
    head_color = workbook.add_format({'bold': True, 'bg_color':'#FFFF00'})  #del True
    for col_index, header_text in enumerate(headers):
        if col_index == sorting:
            sheet.write(0,col_index,header_text,head_color)
        else:
            sheet.write(0,col_index,header_text)

def sort_by_check(sort_by):
    headers = ['name','surname','age','profession']
    if sort_by in headers:
        sorting = headers.index(sort_by)
    else:
        sorting = -1
    return sorting 

def main(args):
    headers = ['name','surname','age','profession']
    workbook = create_workbook(args.output_file)
    sheet = create_worksheet(workbook, headers)
    check_file_existence(args.input_file)
    lines = read_data(args.input_file)
    write_data(workbook,sheet,lines)
    sorting_options = {'n':'name','s':'surname','a':'age','p':'profession'}
    sort_by = sorting_options.get(args.sort_by)   
    sorting = sort_by_check(sort_by)
    sorted_data = sort_data(lines, sorting)
    write_data(workbook,sheet,sorted_data)
    apply_header_color(workbook,sheet,headers,sorting)

    workbook.close()
    print(f"Created: {args.output_file} \nArgumnets has taken from: {args.input_file} \nSorted by: {sort_by}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Take data from names.txt and create sorted Excel file")
    parser.add_argument('input_file',help="Input filename by default: names.txt")
    parser.add_argument('output_file',help="Input Excel file name('filename.xlsx')")
    parser.add_argument('sort_by', choices=['n','s','a','p'], help="Sort by names (n), surnames (s), ages (a), or professions (p)")
    args = parser.parse_args()
    
    main(args)
