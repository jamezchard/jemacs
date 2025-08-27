;; -*- lexical-binding: t -*-

;; --------------------------------------------------------------------------------
;; 基本 key binding
;; --------------------------------------------------------------------------------

;; open init.el
;; global-set-key expects an interactive command. ref: https://stackoverflow.com/q/1250846
(global-set-key (kbd "M-g -") (lambda () (interactive) (find-file user-init-file)))

;; eval init file
(global-set-key (kbd "M-g +") (lambda () (interactive) (eval-expression (load-file user-init-file))))

;; 最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 保存 minibuffer 历史，提升搜索体验
(savehist-mode 1)
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-file (expand-file-name "savehist" user-emacs-directory))

(provide 'init-keybinding)

