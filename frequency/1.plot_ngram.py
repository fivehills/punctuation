# plot_ngram.py
# This script uses the Google Ngram data to create plots for various punctuation marks.

import matplotlib.pyplot as plt
import pandas as pd
from google_ngram_downloader import NgramViewer

def get_ngram_data(phrase, start_year):
    ngram = NgramViewer.get_ngram_data(phrase, start_year, 2019)
    return ngram[phrase]

def plot_ngram(phrase, start_year, file_name):
    data = get_ngram_data(phrase, start_year)
    plt.figure(figsize=(10, 6))
    plt.plot(data['year'], data['frequency'], marker='o', color='blue')
    plt.xlabel('Year')
    plt.ylabel('Frequency')
    plt.title(phrase)
    plt.savefig(file_name)
    plt.close()

if __name__ == "__main__":
    plot_ngram('.', 1500, 'period.jpg')
    plot_ngram(';', 1500, 'semicolon.jpg')
    plot_ngram('?', 1500, 'question_mark.jpg')
    plot_ngram('!', 1500, 'exclamation_mark.jpg')
    plot_ngram("'", 1500, 'apostrophe.jpg')
    plot_ngram('--', 1500, 'dash.jpg')

