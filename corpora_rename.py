#! /usr/bin/python3
#coding: utf-8

import sys
import os
import os.path
from shutil import copyfile

def usage():
    print('%s <input dir> <output dir>' % sys.argv[0])
    sys.exit(-1)

def _format(idx):
    length = len(str(idx))
    fix_length = 6 - length
    return 'id:' + '0' * fix_length + str(idx) + ','

def make_output_dir(path):
    try:
        os.mkdir(path)
    except Exception as e:
        print(e)
        sys.exit(-1)

if __name__ == '__main__':

    if len(sys.argv) - 1 != 2:
        usage()

    in_dir = sys.argv[1]
    out_dir = sys.argv[2]

    if not out_dir.startswith('/'):
        print('[-] Please use absulute path. Path: %s' % out_dir)
        sys.exit(-1)

    make_output_dir(out_dir)

    idx = 0

    for (root, dirs, files) in os.walk(in_dir):
        for sample in files:
            src_path = os.path.join(root, sample)
            format_filename = _format(idx) + sample
            target_path = os.path.join(out_dir, format_filename)
            try:
                copyfile(src_path, target_path)
            except Exception as e:
                print(e)

            idx += 1
