(defmodule lr3-cln-util
  (export all))

(defun clean
  ((state `(#(files ,files) #(dirs ,dirs)))
    (lists:foreach #'rm-file/1 (ensure-absolute state files))
    (lists:foreach #'rm-dir/1 (ensure-absolute state dirs))))

(defun ensure-absolute (state item)
  'noop)

(defun rm-file (filename)
  'noop)

(defun rm-dir (dirname)
  'noop)

