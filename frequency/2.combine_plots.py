# combine_plots.py
# This script combines multiple plots into one figure.

import matplotlib.pyplot as plt
import pandas as pd
from google_ngram_downloader import NgramViewer

def get_ngram_data(phrase, start_year):
    ngram = NgramViewer.get_ngram_data(phrase, start_year, 2019)
    return ngram[phrase]

def plot_combined():
    phrases = ['.', ';', '?', '!', "'", '--']
    titles = ['period', 'semicolon', 'question_mark', 'exclamation_mark', 'apostrophe', 'dash']
    
    plt.figure(figsize=(20, 10))
    for i, (phrase, title) in enumerate(zip(phrases, titles)):
        data = get_ngram_data(phrase, 1500)
        plt.subplot(2, 3, i + 1)
        plt.plot(data['year'], data['frequency'], marker='o', color='blue')
        plt.xlabel('Year', fontsize=14)
        plt.ylabel('Frequency', fontsize=14)
        plt.title(title, fontsize=16)
    
    plt.tight_layout()
    plt.savefig('gram_punct2.jpg', quality=100)
    plt.close()

if __name__ == "__main__":
    plot_combined()

