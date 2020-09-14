#!/usr/bin/python3
"""This module gathers data from an API"""
if __name__ == "__main__":
    from sys import argv
    import requests
    emp_id = argv[1]
    base_url = "https://jsonplaceholder.typicode.com/"
    user_url = "{}users/{}".format(base_url, emp_id)
    emp_name = requests.get(user_url).json().get('name')
    td_url = "{}/todos".format(user_url)
    td_request_json = requests.get(td_url).json()
    td_length = len(td_request_json)
    td_done = 0
    task_list = []
    for todos in td_request_json:
        if todos.get('completed') is True:
            td_done += 1
            task_list.append(todos.get('title'))
    print("Employee {} is done with tasks({:d}/{:d}):".format(emp_name,
                                                                td_done,
                                                                td_length))
    [print("\t {}".format(task)) for task in task_list]
