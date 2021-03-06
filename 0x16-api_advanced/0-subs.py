#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit"""
    user_agent = {'User-agent': 'Safari/605.1.15'}
    req = requests.get(
        "https://www.reddit.com/r/{}/about/.json".format(subreddit),
        headers=user_agent, allow_redirects=False)
    data = req.json().get('data')
    if data is None:
        return 0
    subs = data.get('subscribers')
    return subs
