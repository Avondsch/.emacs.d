;;straight.el and use-package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)
(straight-use-package 'use-package)
(setq use-package-always-ensure t)
;; importing config files
(load-file ".emacs.d/config.el")
(load-file ".emacs.d/org-mode.el")
(load-file ".emacs.d/evil-mode.el")
(load-file ".emacs.d/editor-stuff.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-light-soft airline-base16_gruvbox_light_soft))
 '(custom-safe-themes
   '("4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "6f6e30fdf5235952a21a06d813cdd6cf8620d272149b10a280ff23f2a8e685f3" "7cad0c3eda8e7308e5ee6e8f39768c406a251023ccb32e491af6123633e1b6b2" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(helm-minibuffer-history-key "M-p")
 '(treemacs-no-png-images nil)
 '(treemacs-position 'right))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
