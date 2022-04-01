import datetime


def CompoundEffect(got_Asset, got_Percent, got_Step) -> float:    
    
    asset, percent, step = abs(got_Asset), abs(got_Percent), abs(got_Step)
    now_Time = datetime.datetime.now()
    with open("C:/Users/Masuod/Desktop/Result.txt", "a+") as file:
        file.write(f"{now_Time}: \n")
        file.write(f"asset:{got_Asset} percent:{got_Percent} step:{got_Step}  \n")
        
        for i in range(1, step + 1):
            pAsset = asset
            p = percent * (asset / 100)
            asset += p
            file.write(f"Step{i}: {round(pAsset, 1)}\t+\t{got_Percent}%({round(p, 1)})\t=\t{round(asset, 1)}  \n")

        file.write(f"\n\n")
    
    return round(asset, 1)
    
    
if __name__ == "__main__":
    print(CompoundEffect(-50000, -1, -30))
