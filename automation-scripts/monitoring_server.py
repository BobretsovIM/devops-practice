import subprocess
import datetime
from pathlib import Path

""" Переменная: "path_file=путь к файлу, где указаны hosts".
    Переменная: "path_log_file=путь к файлу, где будут хранится логи".
    Сам файл для переменной "path_log_file" можно не создавать, создатся
    автоматически.
    ФункцияЖ "ping"= проверка статуса сервера, передача результатов в файл "path_log_file".
"""

path_file = Path('/home/server1/hosts/host_server.txt')
path_log_file = Path('/home/server1/ping-host')

host = open(path_file).read().splitlines()

date = datetime.datetime.now()


def ping(address):

    f = open(path_log_file, "a")
    print(f"===={date.strftime('%Y-%m-%d %H:%M')}====", file=f)
    print("Host\t\tСтатус", file=f)
    print("-------------------------", file=f)
    
    for i in address:
        reply = subprocess.run(['ping', '-c', '3', '-n', i], 
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                encoding='utf-8')   
        if reply.returncode == 0:
            print(f"{i} \tРаботает!", file=f)
            
        else:
            print(f"{i} \tНе работает!", file=f)
    print("-------------------------", file=f)
    print("=========КОНЕЦ==========\n", file=f)
    f.close()

if __name__ == "__main__":

    ping(host) 