class Fruit():
    def __init__(self, name, shape, mass, volume):
        self._name = name
        self._shape = shape
        self._mass = mass
        self._volume = volume
        return

    def getName(self):
        return self._name

    def getShape(self):
        return self._shape

    def getMass(self):
        return self._mass

    def getVolume(self):
        return self.volume

    def goodFruit_Check(self):
        self._isGoodFruit = False
        if (self._shape_Check() and self._mass_Check() and self._volume_Check()):
            self._isGoodFruit = True
        return self._isGoodFruit

    def _shape_Check(self):
        self._isGoodShape = False
        if self._shape == "sphere":
            self._isGoodShape = True
        return self._isGoodShape

    def _mass_Check(self):
        self._isGoodMass = False
        if self._mass >= 300 and self._mass <= 600:
            self._isGoodMass = True
        return self._isGoodMass

    def _volume_Check(self):
        self._isGoodVolume = False
        if self._mass >= 100 and self._mass <= 500:
            self._isGoodVolume = True
        return self._isGoodVolume


def fruits(gotFruits):
    goodFruits = {}
    for i in range(len(gotFruits)):
        fruit = Fruit(gotFruits[i]['name'], gotFruits[i]['shape'],
                      gotFruits[i]['mass'], gotFruits[i]['volume'])
        if fruit.goodFruit_Check():
            if fruit.getName() in goodFruits.keys():
                goodFruits[fruit.getName()] += 1
            else:
                goodFruits[fruit.getName()] = 1
    return goodFruits

