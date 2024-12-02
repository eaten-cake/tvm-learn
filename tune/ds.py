import tvm.meta_schedule as ms
from tvm.meta_schedule import database as db

database = db.JSONDatabase(work_dir="./work_dir")

print(dir(database))
records = database.get_all_tuning_records()

print(len(records))
