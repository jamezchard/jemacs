;; -*- lexical-binding: t -*-

;; ----------------------------------------------------------------------------------------------------
;; 基本内置选项设置
;; ----------------------------------------------------------------------------------------------------

(setq inhibit-startup-message t)

;; shift + 方向键来切换 window
;; 跟 org-mode 的日期界面冲突
;; (windmove-default-keybindings)

;; 记住window配置状态，C-c left or right来切换
(winner-mode 1)

;; 显示光标列数
(setq column-number-mode t)

;; 高亮当前行
(global-hl-line-mode 0)

;; 设置 tab 标签宽度
(setq-default tab-width 8)

;; frame 标题显示 buffer 名
(setq frame-title-format "%b")

;; 关闭文件备份
(setq make-backup-files nil)

;; 选中后输入会删除
(delete-selection-mode 1)

;; 开启 narrow 功能
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; 开启全局行号
(global-display-line-numbers-mode)

;; 自动载入外部修改
(global-auto-revert-mode t)

;; 平滑滚动
(setq scroll-conservatively 100)
;; 鼠标平滑滚动
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; 让 dired mode 中目录排在前面
(require 'ls-lisp)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

;; force line wrap to wrap at word boundaries
;; (setq-default word-wrap t)

(add-to-list 'default-frame-alist '(top . 0.5))
(add-to-list 'default-frame-alist '(left . 0.5))
(add-to-list 'default-frame-alist '(width . 160))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(fullscreen))
(add-to-list 'default-frame-alist '(font . "Maple Mono NF CN 11"))

;; 影响启动速度
;; (let* ((ps-script (expand-file-name "powershell/GetDisplayResolution.ps1" user-emacs-directory))
;;        (resolution (shell-command-to-string (format "powershell -File \"%s\"" ps-script)))
;;        (height (string-to-number (cadr (split-string resolution "x"))))
;;        (font-size (cond
;;                    ((= height 1080) 10)
;;                    ((= height 1440) 11)
;;                    ((= height 2160) 12)
;;                    (t 10))))
;;   (message "Screen height detected: %d" height)
;;   (add-to-list 'default-frame-alist `(font . ,(format "Maple Mono NF CN %d" font-size))))


;; 默认编码为 utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(provide 'init-builtin)

