import pandas as pd

Comedy=pd.read_csv('Comedy.csv')
Horror=pd.read_csv('Horror.csv')
Thriller=pd.read_csv('Thriller.csv')
def recommender(emotion):
    if(emotion=='happy' or emotion=='neutral'):
        return Comedy[0:10]
    elif(emotion=='surprise' or emotion=='fear'):
        return Horror[0:10]
    elif(emotion=='angry' or emotion=='disgust'):
        return Thriller[0:10]

recommender('happy')