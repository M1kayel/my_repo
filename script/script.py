#status fail or pass

import os                       
def read_files_in_directory(input_file, output_file):
    with open(output_file,'w', encoding="utf8") as file_out:
        for i in os.listdir(input_file):
            if i.endswith(".txt"):
                file_path = os.path.join(input_file,i)
                with open (file_path,'r', encoding="utf8") as file_in:
                    file_out.write(file_in.read())

INPUT_FILE ="/home/mika/Desktop/test"
OUTPUT_FILE = "result.txt"
read_files_in_directory(INPUT_FILE,OUTPUT_FILE)
