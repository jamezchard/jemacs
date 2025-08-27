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

;; Explicit UTF-8 defaults (centralized here)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
;; Clipboard/selection encoding and common env
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setenv "PYTHONIOENCODING" "UTF-8")

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Faster to disable these here (before they've been initialized)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
