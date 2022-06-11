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
(straight-use-package 'use-package)

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/ide.el")
(load "~/.emacs.d/keybinds.el")
(load "~/.emacs.d/org-mode.el")
(load "~/.emacs.d/extra.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "4f1d2476c290eaa5d9ab9d13b60f2c0f1c8fa7703596fa91b235db7f99a9441b" "74b9e99a8682c86659b8ace1610c4556c4619e6ca812a37b32d2c5f844fdafca" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "566c61d0e40a728d5b631ac276017ace6866574ee58a4b6fbc770e436e481d57" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "e3b2bad7b781a968692759ad12cb6552bc39d7057762eefaf168dbe604ce3a4b" default))
 '(delete-selection-mode nil)
 '(helm-minibuffer-history-key "M-p")
 '(warning-suppress-log-types '((comp) (comp)))
 '(warning-suppress-types
   '(((evil-collection))
     ((evil-collection))
     ((evil-collection))
     (use-package)
     (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
