import requests

Req = requests.get("https://barnamenevisan.info/api/courses/getactivecourses")
Req_Json = Req.json()

# print(Req)

print("--------")

# print(Req_Json)

print("--------")

# print(Req_Json[3])

print("--------")


def fillter(Req_Json):
    teachersList = list(map(lambda tech: tech['teacher'], Req_Json))
    # teachersList = list(teachers)
    filteredTeachersList = list(dict.fromkeys(teachersList))
    return filteredTeachersList


print(fillter(Req_Json))
