import os
import time 

class create_file:
    def __init__(self,dir_name):
        self.dir_name = dir_name

    def create_directory(self):
        os.mkdir(self.dir_name)

    def create_files_in_dir(self):
        self.create_directory()
        for i in range(1,11):
            file_name = f"{self.dir_name}/file{i}.log"
            current_time = time.strftime("%H:%M:%S",time.localtime())
            seconds = int(time.time())
            status = "Pass" if seconds % 2 == 0 else "Fail"
            
            with open (file_name,"w") as file:
                file.write(f"File number{i}\nThe file created at {current_time}\nStatus{status}")

file_creator = create_file("Tests")
file_creator.create_files_in_dir()

