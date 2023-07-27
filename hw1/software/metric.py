from gen.JavaParserLabeled import JavaParserLabeled
from gen.JavaParserLabeledListener import JavaParserLabeledListener


class DSCmetric(JavaParserLabeledListener):
    def __init__(self, package_name):
        self.method_names = []
        self.class_attributes = {}
        self.package_name = package_name

    @property
    def get_method_names(self):
        return {"package_name": self.package_name, "methods": self.method_names}

    @property
    def get_classـnames(self):
        json_output = {"package_name": self.package_name}
        attribute_counts = [(key, value) for key, value in self.class_attributes.items()]
        json_output["classAttributeCount"] = attribute_counts
        return json_output

    def enterTypeDeclaration(self, ctx: JavaParserLabeled.TypeDeclarationContext):
        print(ctx.classOrInterfaceModifier())

    def enterMethodDeclaration(self, ctx: JavaParserLabeled.MethodDeclarationContext):
        self.method_names.append(ctx.IDENTIFIER().getText())

    def enterFormalParameter(self, ctx:JavaParserLabeled.FormalParameterContext):
        print("dassda")

    def enterFieldDeclaration(self, ctx: JavaParserLabeled.FieldDeclarationContext):
        while type(ctx) != JavaParserLabeled.ClassDeclarationContext:
            ctx = ctx.parentCtx
        class_name = ctx.IDENTIFIER().getText()
        key_exists = self.class_attributes.get(class_name, "exists")
        if key_exists != "exists":
            self.class_attributes[class_name] += 1
        else:
            self.class_attributes[class_name] = 1
