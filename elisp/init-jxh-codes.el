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


(provide 'init-jxh-codes)

