#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit"""
    subs = 0
    req = requests.get(
        "https://www.reddit.com/r/{}/about/.json".format(subreddit),
        allow_redirects=False)
    data = req.json().get('data').get('subscribers')
    if subs is None:
        subs = 0
    return subs
