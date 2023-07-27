from antlr4 import *
from gen.JavaParserLabeled import JavaParserLabeled
from gen.JavaLexer import JavaLexer
from metric import DSCmetric
import argparse


def main(args):
    stream = FileStream(args.file, encoding="utf8")
    lexer = JavaLexer(stream)
    token_stream = CommonTokenStream(lexer)
    parser = JavaParserLabeled(token_stream)
    parse_tree = parser.compilationUnit()

    my_listener = DSCmetric(args.file)

    walker = ParseTreeWalker()
    walker.walk(t=parse_tree, listener=my_listener)

    print("compiler result: ")

    print(f"method_names = {my_listener.get_method_names}")
    print(f"class names and attribute count = {my_listener.get_classـnames}")


if __name__ == "__main__":
    argparser = argparse.ArgumentParser()
    argparser.add_argument(
        '-n', '--file',
        help="Input source", default=r'A.java'
    )
    args = argparser.parse_args()
    main(args)
