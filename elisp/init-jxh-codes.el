;; -*- lexical-binding: t -*-

;; ----------------------------------------------------------------------------------------------------
;; 自己写的功能代码
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

(provide 'init-jxh-codes)

