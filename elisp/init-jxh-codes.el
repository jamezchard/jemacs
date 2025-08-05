;; -*- lexical-binding: t -*-
;; 自己写的功能代码


;; ----------------------------------------------------------------------------------------------------
;; 搜索当前选中内容
;; ----------------------------------------------------------------------------------------------------
(defun jxh-isearch-forward ()
  "Start isearch with selected region if any, otherwise start normal isearch."
  (interactive)
  (if (use-region-p)
      (let ((search-text (buffer-substring-no-properties (region-beginning) (region-end))))
        (deactivate-mark)
        (isearch-mode t nil nil nil)
        (isearch-yank-string search-text))
    (isearch-forward)))
(global-set-key (kbd "C-s") 'jxh-isearch-forward)


;; ----------------------------------------------------------------------------------------------------
;; C-u C-x C-f call find-file-literally 打开大文件
;; ----------------------------------------------------------------------------------------------------
(defun jxh-find-file (arg)
  "Call `find-file` or `find-file-literally` depending on whether a prefix argument is given."
  (interactive "P")
  (if arg
      (call-interactively #'find-file-literally)
    (call-interactively #'find-file)))
;; Override the default find-file
(global-set-key (kbd "C-x C-f") 'jxh-find-file)

(defun jxh-generate-dir-locals-for-python-venv (venv-path)
  "Generate a .dir-locals.el file in current directory for the given VENV-PATH."
  (interactive
   (list
    (read-directory-name "Select Python virtualenv directory: " nil nil t)))
  (let* ((venv-path (directory-file-name (expand-file-name venv-path)))
         (venv-bin (if (eq system-type 'windows-nt)
                       "Scripts/python.exe"
                     "bin/python"))
         (python-exe (expand-file-name venv-bin venv-path))
         (dir-locals-file (expand-file-name ".dir-locals.el" default-directory))
         (content (format
                   "((python-mode . (
  (pyvenv-activate . \"%s\")
  (python-shell-interpreter . \"%s\")
  (eglot-workspace-configuration . ((:python . (:pythonPath \"%s\"))))
)))"
                   venv-path python-exe python-exe)))
    (when (or (not (file-exists-p dir-locals-file))
              (y-or-n-p "Overwrite existing .dir-locals.el? "))
      (with-temp-file dir-locals-file
        (insert content))
      (message ".dir-locals.el written for venv: %s" venv-path))))

(provide 'init-jxh-codes)

