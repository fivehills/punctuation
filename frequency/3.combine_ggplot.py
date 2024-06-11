# combine_ggplot.py
# This script combines multiple ggplot-style plots into one figure.

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def combine_ggplots():
    co = pd.read_csv("colon.csv", header=None, names=["Year", "Frequency"])
    ca = pd.read_csv("comma.csv", header=None, names=["Year", "Frequency"])
    cp = pd.read_csv("twowordhy.csv", header=None, names=["Year", "two_word", "three_word"])
    pos = pd.read_csv("poshy.csv", header=None, names=["Year", "Noun", "Verb", "Adj", "Adv"])

    cp_melted = cp.melt(id_vars=['Year'], var_name='WordCount', value_name='Frequency')
    pos_melted = pos.melt(id_vars=['Year'], var_name='POS', value_name='Frequency')

    fig, axes = plt.subplots(2, 2, figsize=(20, 15))

    sns.lineplot(x='Year', y='Frequency', data=ca, ax=axes[0, 0]).set_title('Comma')
    sns.lineplot(x='Year', y='Frequency', data=co, ax=axes[0, 1]).set_title('Colon')
    sns.lineplot(x='Year', y='Frequency', hue='WordCount', data=cp_melted, ax=axes[1, 0]).set_title('Hyphen')
    sns.lineplot(x='Year', y='Frequency', hue='POS', data=pos_melted, ax=axes[1, 1]).set_title('Hyphen POS')

    plt.tight_layout()
    plt.savefig('punct4.jpg', dpi=800)
    plt.close()

if __name__ == "__main__":
    combine_ggplots()

