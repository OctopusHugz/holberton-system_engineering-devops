#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit"""
    subs = 0
    user_agent = {'User-agent': 'Safari/605.1.15'}
    req = requests.get(
        "https://www.reddit.com/r/{}/about/.json".format(subreddit),
        headers=user_agent)
    data = req.json().get('data')
    subs = data.get('subscribers')
    if subs is None:
        subs = 0
    return subs
