#!/usr/bin/python3
"""This module gathers data from an API and exports it to a CSV file"""
if __name__ == "__main__":
    import json
    import requests
    from sys import argv
    emp_id = argv[1]
    base_url = "https://jsonplaceholder.typicode.com/"
    user_url = "{}users/{}".format(base_url, emp_id)
    emp_uname = requests.get(user_url).json().get('username')
    td_url = "{}/todos".format(user_url)
    td_request_json = requests.get(td_url).json()
    td_length = len(td_request_json)
    td_done = 0
    new_dict = {}
    filename = emp_id + ".json"
    with open(filename, "w") as f:
        for td in td_request_json:
            td['username'] = emp_uname
            td['task'] = td['title']
            del td['title']
            del td['userId']
            del td['id']
        new_dict.update({emp_id: td_request_json})
        f.write(json.dumps(new_dict))
