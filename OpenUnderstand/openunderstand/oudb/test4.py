from pprint import pprint
from metrics.count_decl_file import declare_file

try:
    import understand as und
except ImportError:
    print("Can not import understand")

db = und.open(
    "C:/Users/mjava/Desktop/courses/compiler/project-1/projects/testing_legacy_code/src/src.und")

packages = declare_file()
counter = 0
for ent in db.ents():
    try:
        counter += 1
        methods_1 = ent.metric(["CountDeclFile"]).get("CountDeclFile", 0)
        if methods_1 > 0:
            print(ent.longname())
            print("with api ", methods_1)
            print("+++++")
            print("with query", packages[ent.longname()])
            print("-" * 25)
    except:
        pass
