#!/usr/bin/python3
"""This module gathers data from an API and exports it to a CSV file"""
if __name__ == "__main__":
    import csv
    import requests
    from sys import argv
    emp_id = argv[1]
    base_url = "https://jsonplaceholder.typicode.com/"
    user_url = "{}users/{}".format(base_url, emp_id)
    emp_uname = requests.get(user_url).json().get('username')
    td_url = "{}/todos".format(user_url)
    td_request_json = requests.get(td_url).json()
    filename = emp_id + ".csv"
    with open(filename, "w") as f:
        td_writer = csv.writer(f, quotechar='"', quoting=csv.QUOTE_ALL)
        for td in td_request_json:
            td_writer.writerow([td['userId'], emp_uname, td['completed'],
                                td['title']])
