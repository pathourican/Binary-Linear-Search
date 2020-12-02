	;; Patrick Hourican
	;; pjh4as
	;; 10/29/2020
	;; linearSearch.s

	global linearSearch

	section .text
	
	;; array - rdi
	;; size - rsi
	;; target - edx
	
linearSearch:
	xor	r10, r10	; zero out the counter register
loop:	
	cmp	rsi, r10	; if at end of list, end (not found)
	je	notFound
	cmp	edx, [rdi+r10*4] ; if current value at index equals target, end 
	je	done
	inc	r10		; increment counter at end of loop
	jmp	loop		; loop

notFound:
	mov	rax, -1		; if not found, return -1
	ret

done:
	mov	rax, r10	; move the current counter value (index) into the return reg
	ret
	
	
