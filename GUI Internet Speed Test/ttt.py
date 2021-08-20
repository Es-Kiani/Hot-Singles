import speedtest


def test():
    s = speedtest.Speedtest()
    s.get_servers()
    s.get_best_server()
    s.download()
    s.upload()
    res = s.results.dict()
    print (res["download"])
    print (res["upload"])
    print (res["ping"])

test()