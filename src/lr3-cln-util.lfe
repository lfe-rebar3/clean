(defmodule lr3-cln-util
  (export all))

(include-lib "clj/include/compose.lfe")

(defun clean
  ((state `(#(files ,files) #(dirs ,dirs)))
    (lists:foreach #'rm-file/1 (check-files state files))
    (lists:foreach #'rm-dir/1 (check-dirs state dirs))))

(defun rm-file (filename)
  (rebar_api:console " ~~~~> \tRemoving file ~s ..." `(,filename)))

(defun rm-dir (dirname)
  (rebar_api:console " ~~~~> \tRemoving directory ~s ..." `(,dirname)))

(defun check-files (state files)
  (->> files
       (expand-globs)
       (ensure-absolute state)
       (ensure-files)))

(defun check-dirs (state dirs)
  (->> dirs
       (expand-globs)
       (ensure-absolute state)
       (ensure-dirs)))

(defun expand-globs (items)
  (rebar_api:info "Expanding wildcard values ..." '())
  (-> items
      (lists:map #'filelib:wildcard/1)
      (lists:append)))

(defun ensure-absolute (state item)
  (rebar_api:info "Coercing ~p to an absolute path ..." `(,item))
  (rebar_api:info "Current directory: ~p" `(,(rebar_state:dir state)))
  item)

(defun ensure-files (files)
  (rebar_api:info "Keeping only items that are files ..." '())
  (lists:filtermap #'get-file/1 files))

(defun ensure-dirs (dirs)
  (rebar_api:info "Keeping only items that are directories ..." '())
  (lists:filtermap #'get-dir/1 dirs))

(defun get-file (file)
  (case (filelib:is_file file)
    ('true `#(true ,file))
    (_ 'false)))

(defun get-dir (dir)
  (case (filelib:is_dir dir)
    ('true `#(true ,dir))
    (_ 'false)))
