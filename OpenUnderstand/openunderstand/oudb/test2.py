from pprint import pprint
from metrics.count_decl_class_variable import declare_class_variables

try:
    import understand as und
except ImportError:
    print("Can not import understand")

db = und.open(
    "C:/Users/mjava/Desktop/courses/compiler/project-1/projects/JSON/src/src.und")

method_counts = declare_class_variables()
counter = 0
for ent in db.ents('Java Class ~Unknown ~Unresolved'):
    try:
        counter += 1
        methods_1 = ent.metric(["CountDeclClassVariable"]).get("CountDeclClassVariable", 0)
        if methods_1 > 0:
            print(ent.longname())
            print("with api ", methods_1)
            print("+++++")
            print("with query", method_counts[ent.longname()])
            print("-" * 25)
    except:
        pass
