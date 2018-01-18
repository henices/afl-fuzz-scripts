#! /usr/bin/python3
#coding: utf-8

import sys
import os
import os.path
import argparse
from shutil import copyfile

def _format(idx):
    length = len(str(idx))
    fix_length = 6 - length
    return 'id:' + '0' * fix_length + str(idx) + ','

if __name__ == '__main__':

    parser = argparse.ArgumentParser(
            description='Corpora rename script for afl-fuzz')
    parser.add_argument('-i', '--input',required=True, help='input directory')
    parser.add_argument('-o', '--output',required=True, help='output directory')
    parser.add_argument('-n', '--number', type=int, required=False, default=0,
            help='first id')
    args = parser.parse_args()

    in_dir = args.input
    out_dir = args.output
    idx = args.number

    os.mkdir(out_dir)

    for (root, dirs, files) in os.walk(in_dir):
        for sample in files:
            src_path = os.path.join(root, sample)
            afl_testcase = _format(idx) + sample
            target_path = os.path.join(out_dir, afl_testcase)
            try:
                copyfile(src_path, target_path)
            except Exception as e:
                print(e)

            idx += 1
