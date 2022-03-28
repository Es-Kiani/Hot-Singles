def CompoundEffect(got_Asset, got_Percent, got_Step) -> float:
    
    
    asset, percent, step = abs(got_Asset), abs(got_Percent), abs(got_Step)
    
    for i in range(step):
        p = percent * (asset / 100)
        asset += p
    
    return round(asset, 1)
    
    
if __name__ == "__main__":
    print(CompoundEffect(-50000, -1, -30))
