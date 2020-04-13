#! /usr/bin/env python
import requests as r
import logging as log
import sys

log.basicConfig(level=log.DEBUG, stream=sys.stdout)

servers_with_responses = {
    "http://first_server": "first_server",
    "http://second_server": "second_server",
    "http://third_server": "third_server",
}

for url, expected in servers_with_responses.items():
    response = r.get(url)
    assert (
        response.status_code == 200
    ), f"""
    Failed to get a valid response from url={url}
    """

    actual = response.json()
    assert (
        expected == actual
    ), f"""
    Failed to find valid response from url={url}

    expected: {expected}
    actual: {actual}
    """
