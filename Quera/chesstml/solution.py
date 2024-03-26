import re as r


def process(got_Name):
    with open(got_Name, 'r', encoding='UTF-8') as file:
        a = r.findall("</a>", file.read())

    a_count = 0
    if any(a):
        for i in a:
            a_count += 1

    file.close()
    print(a_count)
    return a_count


process("htmlsampletest1.html")
process("htmlsampletest2.html")
