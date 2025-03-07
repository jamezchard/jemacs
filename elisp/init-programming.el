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

(use-package consult-eglot
  :ensure t)

(use-package consult-eglot-embark
  :ensure t
  :after (embark consult-eglot)
  :config
  (consult-eglot-embark-mode))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main"))
(add-hook 'prog-mode-hook 'copilot-mode)
;; 物理和逻辑两种 tab 键
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)


(provide 'init-programming)
