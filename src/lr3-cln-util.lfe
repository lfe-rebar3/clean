(defmodule lr3-cln-util
  (export all))

(defun clean
  ((state `(#(files ,files) #(dirs ,dirs)))
    (lists:foreach #'rm-file/1 (check-files state files))
    (lists:foreach #'rm-dir/1 (check-dirs state dirs))))

(defun rm-file (filename)
  (rebar_api:console " ~~~~> \tRemoving file ~s ..." `(,filename))
  (os:cmd (++ "rm " filename)))

(defun rm-dir (dirname)
  (rebar_api:console " ~~~~> \tRemoving directory ~s ..." `(,dirname))
  (os:cmd (++ "rm -rf " dirname)))

(defun check-files (state files)
  (clj:->> files
           (expand-globs)
           (ensure-absolute state)
           (ensure-files)))

(defun check-dirs (state dirs)
  (clj:->> dirs
           (expand-globs)
           (ensure-absolute state)
           (ensure-dirs)))

(defun expand-globs (items)
  (rebar_api:debug "Expanding wildcard values ..." '())
  (clj:->> items
           (lists:map #'filelib:wildcard/1)
           (lists:append)))

(defun ensure-absolute (state items)
  (let ((dir (rebar_state:dir state)))
    (rebar_api:debug "Coercing elements of ~p to absolute path ..." `(,items))
    (rebar_api:debug "Current directory: ~p" `(,dir))
    (lists:map (lambda (x) (filename:join dir x)) items)))

(defun ensure-files (files)
  (rebar_api:debug "Keeping only items that are files ..." '())
  (lists:filtermap #'get-file/1 files))

(defun ensure-dirs (dirs)
  (rebar_api:debug "Keeping only items that are directories ..." '())
  (lists:filtermap #'get-dir/1 dirs))

(defun get-file (file)
  (case (filelib:is_file file)
    ('true `#(true ,file))
    (_ 'false)))

(defun get-dir (dir)
  (case (filelib:is_dir dir)
    ('true `#(true ,dir))
    (_ 'false)))
