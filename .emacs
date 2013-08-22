;;
;;
;; iroro's massive .emacs file 
;;
;; jan 22, 2001

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no emacs start-up message 
;; (setq inhibit-startup-message t) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Redefine some keys.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prevent echoing ^M in the shell (a hard one)
;;(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  TeX stuff + mode info
;;
;; fontification font-lock.el much better than the default hilit19.el
;; (for coloring)
;; automatic Font Lock mode in TeX mode 
;; (add-hook 'tex-mode-hook 'turn-on-font-lock) 
;; if Font Lock necessary for other than .tex files, uncomment following
;; (global-font-lock-mode t) 
;;
;; load default lisp file (.el) for improved LaTeX mode
;; all settings are located in tex-site, hence
;;**************************************************************
(load "C:/Program Files/TextEditors/XEmacs/xemacs-packages/lisp/auctex/tex-site")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Matlab mode baby . . . essential!!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(defun my-matlab-mode-hook ()
  (setq matlab-indent-function t)  ; if you want function bodies indented
  (setq fill-column 90)            ; where auto-fill should wrap
  (turn-on-auto-fill))

(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(defun my-matlab-shell-mode-hook ()
  '())
(setq matlab-mode-hook 'my-matlab-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add hooks for other modes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 
'(lambda ()
   (turn-on-auto-fill)))           ; Auto fill in Text mode


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook 
          '(lambda () 
             (if window-system 
                 (condition-case nil     
                     (progn 
                       (load "func-menu")    ; load function menu
                       (define-key global-map [S-down-mouse-3] 'function-menu))
                   (error nil)))
             ;;
             ;; set up a new menu in the elisp mode
             ;;
             (define-key emacs-lisp-mode-map [menu-bar elisp]
               (cons "Elisp" (make-sparse-keymap "elisp")))
             (define-key emacs-lisp-mode-map [menu-bar elisp debonenoff]
               '("Cancel Debug on Entry" . cancel-debug-on-entry))
             (define-key emacs-lisp-mode-map [menu-bar elisp debonen]
               '("Debug on Entry" . debug-on-entry))
             (define-key emacs-lisp-mode-map [menu-bar elisp debdefun]
               '("Debug Defun" . edebug-defun))
             (define-key emacs-lisp-mode-map [menu-bar elisp evalbuff]
               '("Eval Buffer" . eval-buffer))
             (define-key emacs-lisp-mode-map [menu-bar elisp evalreg]
               '("Eval Region" . eval-region))
             (define-key emacs-lisp-mode-map [menu-bar elisp evaldef]
               '("Eval Defun" . eval-defun))
             (font-lock-mode 1)    
             (line-number-mode 1)))          ; line-numbers


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode make your c code easy on the eyes, 
;; so no manly code (tm)!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-c-mode-common-hook ()
  
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+)
  
  ;;(define-key c-mode-mode-map [return] 'newline-and-indent)
  (auto-fill-mode)
  (setq indent-tabs-mode nil)
  (c-toggle-auto-hungry-state 1)

  ;;(local-set-key [return] 'newline-and-indent)
  ;; other customizations can go here
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c++-mode 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-c++-mode-common-hook ()
  
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+)
  
  ;;(define-key c-mode-mode-map [return] 'newline-and-indent)
  (auto-fill-mode)
  (setq indent-tabs-mode nil)
  (c-toggle-auto-hungry-state 1)

  ;;(local-set-key [return] 'newline-and-indent)
  ;; other customizations can go here
  )

(add-hook 'c++-mode-common-hook 'my-c++-mode-common-hook)

(defun my-java-mode-common-hook ()
  
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 1)
  (c-set-offset 'case-label '+)
  
  ;;(define-key c-mode-mode-map [return] 'newline-and-indent)
  (auto-fill-mode)
  (setq indent-tabs-mode nil)
  (c-toggle-auto-hungry-state 1)

  ;;(local-set-key [return] 'newline-and-indent)
  ;; other customizations can go here
  )

(add-hook 'java-mode-common-hook 'my-java-mode-common-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up automatic syntax highlighting for the various modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c-mode-hook 'turn-on-font-lock)
(add-hook 'c++-mode-hook 'turn-on-font-lock)
(add-hook 'c-mode-hook 'turn-on-font-lock)
(add-hook 'java-mode-hook 'turn-on-font-lock)
(add-hook 'matlab-mode-hook 'turn-on-font-lock)
(add-hook 'lisp-mode-hook 'turn-on-font-lock)
(add-hook 'LaTeX-mode-hook 'turn-on-font-lock)

(setq font-lock-maximum-decoration t)

;; cos we're dumb and don't want to rebuild the wheel
(setq-default ispell-program-name "aspell") 
;(setq-default ispell-extra-args '("--reverse")) 

;; fin