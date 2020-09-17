#!/usr/bin/python3
"""This module queries the Reddit API"""
import requests


def top_ten(subreddit):
    """Prints the titles of the first 10 hot posts listed for a subreddit"""
    user_agent = {'User-agent': 'Safari/605.1.15'}
    req = requests.get(
        "https://www.reddit.com/r/{}/hot/.json?limit=10".format(subreddit),
        headers=user_agent, allow_redirects=False)
    data = req.json().get('data')
    if data is None:
        print(None)
    children = data.get('children')
    for child in children:
        print(child.get('data').get('title'))
