;; -*- lexical-binding: t -*-

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; Restore GC settings after startup and tune during minibuffer usage
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1)))

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (setq gc-cons-threshold (* 128 1024 1024))))

(add-hook 'minibuffer-exit-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024))))

;; Prevent unwanted runtime compilation for gccemacs (native-comp) users;
;; packages are compiled ahead-of-time when they are installed and site files
;; are compiled when gccemacs is installed.
(setq native-comp-jit-compilation nil)

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

;; `use-package' is builtin since 29.
;; It must be set before loading `use-package'.
(setq use-package-enable-imenu-support t)

;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

;; ================================================================================
;; 全面启用 UTF-8，带点冗余，但不影响运行
;; ================================================================================
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
;; python subprocess 输出用 UTF-8
(setenv "PYTHONIOENCODING" "UTF-8")
;; X11 剪贴板，防止乱码（Linux 下有用）
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; windows 下的 locale，保证子进程也用 UTF-8
(setenv "LANG" "en_US.UTF-8")


;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Faster to disable these here (before they've been initialized)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
