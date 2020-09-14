#!/usr/bin/python3
"""This module gathers data from an API and exports it to a JSON file"""
if __name__ == "__main__":
    import json
    import requests
    from sys import argv
    base_url = "https://jsonplaceholder.typicode.com/"
    all_user = requests.get("{}users".format(base_url)).json()
    count = 1
    new_dict = {}
    while count <= len(all_user):
        user_url = "{}users/{}".format(base_url, count)
        emp_uname = requests.get(user_url).json().get('username')
        td_url = "{}/todos".format(user_url)
        td_request_json = requests.get(td_url).json()
        for td in td_request_json:
            td['username'] = emp_uname
            td['task'] = td['title']
            del td['title']
            del td['userId']
            del td['id']
        new_dict.update({count: td_request_json})
        count += 1
    with open("todo_all_employees.json", "w") as f:
        f.write(json.dumps(new_dict))
