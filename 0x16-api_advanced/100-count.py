#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def count_words(subreddit, word_list, count=0, after="", hot_list=[], title_dict={}, word_count=0):
    """Prints a sorted count of given keywords listed for a subreddit"""
    user_agent = {'User-agent': 'Safari/605.1.15'}
    if not after:
        req = requests.get(
            "https://www.reddit.com/r/{}/hot/.json?limit=100".format(
                subreddit),
            headers=user_agent, allow_redirects=False)
    else:
        req = requests.get(
            "https://www.reddit.com/r/{}/hot/.json?limit=100&after={}".format(
                subreddit, after),
            headers=user_agent, allow_redirects=False)
    data = req.json().get('data')
    if data is None:
        return None
    after = data.get('after')
    children = data.get('children')
    for child in children:
        title = child.get('data').get('title').lower().split()
        for word in word_list:
            word = word.lower()
            word_count += title.count(word)
            if word_count > 0:
                title_dict.update({word: word_count})
            # print(title_dict)
        # for word in word_list:
        #     word = word.lower()
        #     if word in title:
        #         hot_list.append(title)
        #         word_count = title_dict.get(word)
        #         if word_count is None:
        #             word_count = 1
        #         else:
        #             word_count += 1
        #         title_dict.update({word: word_count})
    count += len(children)
    if after is not None:
        count_words(subreddit, word_list, count, after,
                    hot_list, title_dict, word_count)
    else:
        # dict_copy = title_dict.copy()
        for keyword in title_dict:
            # max_title = ""
            print("{}: {:d}".format(keyword, title_dict.get(keyword)))
    # print(hot_list)
    return hot_list
