;;; win-settings.el --- Windows OS specific configs
;;; Commentary:

;; Turn off Bell Sound
(set-message-beep 'silent)

;; ------------------------------------------------------------
;; Run Various Shell Programs

;; bash from MSYS2 - location of bash.exe may need to be configured
(defun run-bash ()
  (interactive)
  (let ((shell-file-name "C:\\msys64\\usr\\bin\\bash.exe"))
    (shell "*bash*")))

;; CMD
(defun run-cmdexe ()
  (interactive)
  (let ((shell-file-name "cmd.exe"))
    (shell "*cmd.exe*")))

;; Powershell
(defun run-powershell ()
  "Run powershell"
  (interactive)
  (async-shell-command
   "c:/windows/system32/WindowsPowerShell/v1.0/powershell.exe -Command -"
   nil nil))

;; ------------------------------------------------------------
(provide 'win-settings)

;;; win-settings.el ENDS HERE
