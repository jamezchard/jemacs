;; toggle comment
(global-set-key (kbd "M-;") 'comment-line)

(setq c-basic-offset 4)
;; 在 c/c++ mode 中切换头/源文件
(add-hook 'c-mode-hook   (lambda () (local-set-key (kbd "M-o") 'ff-find-other-file)))
(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "M-o") 'ff-find-other-file)))

(use-package eglot
  :ensure t
  :hook ((c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (python-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))
  (add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio"))))

(provide 'init-programming)
