#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def recurse(subreddit, hot_list=[], count=0, after=""):
    """Prints the titles of the first 10 hot posts listed for a subreddit"""
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
        hot_list.append(child.get('data').get('title'))
    count += len(children)
    if after is not None:
        recurse(subreddit, hot_list, count, after)
    return hot_list
