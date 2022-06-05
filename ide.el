;;IDE configurations for emacs.

;; Helm, and Corfu
(global-set-key (kbd "M-x") 'helm-M-x)
(use-package helm
  :straight t
  :init (helm-mode t)
  :config (setq helm-full-frame t))

(use-package swiper-helm
 :straight t
  :init
  :bind (("<leader> s d" . swiper-helm)))


;;corfu
(use-package corfu
  :straight t
   :custom
   (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
   (corfu-auto t)                 ;; Enable auto completion
   (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
   (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
   :hook ((prog-mode . corfu-mode)
          (shell-mode . corfu-mode)
          (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-excluded-modes'.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))




;;syntax highlighting via tree-sitter and lsp-mode
(use-package tree-sitter
  :straight t
  :init (setq global-tree-sitter-mode t))
(use-package tree-sitter-langs
  :straight t)
(use-package rainbow-delimiters
  :straight t
:config(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))
