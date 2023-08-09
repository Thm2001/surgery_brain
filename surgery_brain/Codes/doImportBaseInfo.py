import pandas as pd
import sqlite3


def doImportTable(file_name, files_path, db_path):
    df = pd.read_csv(files_path + file_name + '.csv', dtype=str)
    df.fillna('', inplace=True)
    conn = sqlite3.connect(db_path)
    df.to_sql(file_name, conn, if_exists='replace', index=False)
    conn.commit()
    conn.close()


def do_import_baseinfo(files_path, db_path):
    TABLE_NAME_LIST = ['医生信息表', '手术日表', '手术间表', '手术间约束表', '特殊手术约束表']
    for file_name in TABLE_NAME_LIST:
        doImportTable(file_name, files_path=files_path, db_path=db_path)


if __name__ == "__main__":
    do_import_baseinfo(files_path="../Data/BaseInfoExcel/", db_path="../Data/DataBase/BaseInfo.db")