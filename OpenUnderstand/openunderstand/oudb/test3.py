from pprint import pprint
from metrics.count_decl_executable_unit import declare_executable_unit

try:
    import understand as und
except ImportError:
    print("Can not import understand")

db = und.open(
    "C:/Users/mjava/Desktop/courses/compiler/project-1/projects/JSON/src/src.und")

executable_units = declare_executable_unit()
counter = 0
for ent in db.ents():
    try:
        counter += 1
        methods_1 = ent.metric(["CountDeclExecutableUnit"]).get("CountDeclExecutableUnit", 0)
        if methods_1 > 0:
            print(ent.longname())
            print("with api ", methods_1)
            print("+++++")
            print("with query", executable_units[ent.longname()])
            print("-" * 25)
    except:
        pass
