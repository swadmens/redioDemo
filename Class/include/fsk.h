/********************************************************************
*	File Name: 	        fsk.h	
*	Author:             qiao gang
*	Copyright 1992-2014, ZheJiang Dahua Technology Stock Co.Ltd.
* 						All Rights Reserved
*	Description:fsk�㷨
*	Created:	        2014:09:23  18:50
*	Revision Record:    
*********************************************************************/

#ifndef _FSK_H
#define _FSK_H

#ifdef __cplusplus
extern "C" {
#endif

/*----------------------------------------*/
#ifdef _WIN32

    #ifndef FSK_LIB_EXPORTS
        #ifdef FSK_EXPORTS
#define FSK_API    __declspec(dllexport)
        #else
#define FSK_API    __declspec(dllimport)
        #endif
    #else
#define FSK_API
    #endif

#else

#define FSK_API

#endif
/*----------------------------------------*/

#include "audio_typedef.h"

/* The type of API parameters */
#undef  IN
#undef  INOUT
#undef  OUT
#define IN
#define INOUT
#define OUT

/* return enum */
typedef enum
{
	FSK_RX_END           =  2, /* �յ�����һ֡��������ݻ�ʱ */
	FSK_RX_START         =  1, /* ��ʼ��������һ֡����������� */
	/* ע�⣺���ն�ÿ�ε���fsk_rx�����������ݹ���ʱ�����׵���  */
	/* FSK_RX_END��FSK_RX_START����ֵ��û                      */
	FSK_RUN_OK           =  0, /* ��ȷִ��                     */
	FSK_ALLOC_FAILED     = -1, /* �����ڴ�ʧ��                 */
	FSK_POINTER_NULL     = -2, /* ָ��Ϊ��                     */
	FSK_IN_POINTER_NULL  = -3, /* �ṹ���ڲ�ָ��Ϊ��           */
	FSK_IN_LEN_ERROR     = -4, /* ���볤�ȴ���                 */
	FSK_IN_CH_ERROR      = -5, /* ����ͨ��������               */
	FSK_IN_DEPTH_ERROR   = -6, /* ����������ȴ���             */
	FSK_IN_OFFSET_ERROR  = -7, /* ������Ƶ�������             */
	FSK_FREQ_ERROR       = -8, /* ����Ƶ�ʴ���                 */
    FSK_IN_SIZE_ERROR    = -9, /* �����С����                 */
    FSK_IN_RTX_ERROR     = -10,/* ���뷢�ͽ��ձ�־����         */
	FSK_OUT_OFFSET_ERROR = -11,/* �����Ƶ�������             */
	FSK_DATA_RATE_ERROR  = -12,/* �����շ����ʴ���             */
	FSK_RX_DATA_ERROR    = -13,/* �������ݴ���                 */
	FSK_TONE_ERROR       = -14,/* ��ǰ�����ʲ�֧�ֱ���������   */
	FSK_BASE_FREQ_ERROR  = -15,/* ��Ƶ���ô���                 */
	FSK_RX_ERROR         = -16 /* ���ݽ��ճ���                 */
} FSK_RESULT;

typedef struct
{
	WORD32 frequency;  /* ��Ƶ����Ƶ�ʣ���λ��Hz                                                                                  */
	WORD32 base_freq;  /* �շ��źŻ�Ƶ���������ý������£�(ע�����ն˺ͷ��Ͷ˱�����ȣ��ò������ն˺ͷ��Ͷ˶�ʹ��)                */
					   /* 44.1KHz�����ϲ����ʣ�17000��ʹ�ò��ܱ��������ĳ������������ݣ�һ���ͬʱ�򿪱�����ʾ��                  */
                       /*   32KHz�����²����ʣ�1000��ʹ�ÿ��Ա���������������������                                               */
	int    out_offset; /* ���������Ƶ������֮��ļ������λ���ֽڣ��ò��������Ͷ�ʹ�ã����ն���������                            */
	int    data_rate;  /* �����շ����ʣ���λ��bps��������Ϊ300bps(ע�����ն˺ͷ��Ͷ˱�����ȣ��ò������ն˺ͷ��Ͷ˶�ʹ��)         */
	int    fsk_ctrl;   /* ���Ʋ��������������ã����嶨�����£�                                                                    */
                       /* bit-0  ��=0�����նˣ�=1�����Ͷ�                                                                         */
                       /* bit-2~1��=00���ޱ�����ʾ����=01��ʹ��Ĭ�ϵı�����ʾ���������񱳾���������ʱ��frequency�������44.1KHz�� */
					   /* =10��ʹ���Զ���ı�����ʾ������ʱ��frequency������ڵ���44.1KHz����������Զ�����Ƶ������16λ��PCM���ݣ�*/
                       /* =����������ֵ���������ļ��ʱ��ԼΪ�����뷢�ͺ����������ֽ���*10/data_rate����λ���롣�ñ���λ�����Ͷ�ʹ*/
                       /* �ã����ն���������                                                                                      */
                       /* other bits������λ                                                                                      */
    AudioBuf bg_music; /* �Զ��屳����ʾ����������Ƶ�ṹ�壬�����Ͷ�������Ϊʹ���Զ��屳����ʾ��ʱʹ�ã����ն���������            */
} Fsk_Format;

/********************************************************************
*	Funcname: 	    	fsk_init
*	Purpose:	fsk�㷨�ڴ����ͳ�ʼ��
*   InputParam:   INOUT Audio_Handle *phFsk:���
*   OutputParam:        
*   Return:             FSK_RESULT
*   Created:	        2014:09:23  18:28
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_init( INOUT Audio_Handle *phFsk );

/********************************************************************
*	Funcname: 	    	fsk_setFormat
*	Purpose:	����fsk�㷨
*   InputParam:      IN Fsk_Format    *pFormat:fsk�㷨����
*   OutputParam:    OUT Audio_Handle  hFsk
*   Return:             FSK_RESULT
*   Created:	        2014:09:23  18:32
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_setFormat( OUT Audio_Handle hFsk, IN Fsk_Format *pFormat );

/********************************************************************
*	Funcname: 	    	fsk_getSize
*	Purpose:	��ȡfsk_rx��fsk_tx������������ڴ��С�����ڿ�ĵ�������ǰ����
*               pFskOutput��pAudioDst->pData��Ӧ���ڴ��С����λ���ֽڡ�
*               ע�⣺1.�ú����ķ���ֵ�����ڿ����ڴ棬��ȫ���������ֵ���ܱ�ʵ��ֵ��һЩ��
*                     2.fsk_init������fsk_setFormat����ִ�к󣬲��ܵ��øú�����
*   InputParam:   INOUT Audio_Handle hFsk
*                    IN int          input_size:���ڷ��ͱ�ʾ�������뷢�ͺ����������ֽ�������fsk_tx���������inLen��
*                                               ���ڽ��ձ�ʾ����������պ�����PCM����ʱ��(��λ������)
*                    IN int          rx_tx_flag:0-���գ�1-����
*   OutputParam:    OUT int         *pOutLen   :������������ڴ��С����λ���ֽڡ����ڷ��ͱ�ʾpAudioDst->pData��Ӧ���ڴ��С��
*                                               ���ڽ��ձ�ʾpFskOutput��Ӧ���ڴ��С��
*   Return:             FSK_RESULT
*   Created:	        2015:08:06  17:09
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_getSize( OUT Audio_Handle hFsk, IN int input_size, IN int rx_tx_flag, OUT int *pOutSize );

/********************************************************************
*	Funcname: 	    	fsk_rx
*	Purpose:	fsk�����㷨�����ڴ���Ч�ʿ��ǣ��շ�����δ��У�飬���������ϲ�Э���м���У���ֶΣ�
*   InputParam:   INOUT Audio_Handle hFsk
*                    IN AudioBuf    *pAudioSrc :������Ƶ�ṹ��ָ��
*   OutputParam:    OUT WORD8       *pFskOutput:������ս��
*                   OUT int         *pOutLen   :����������ݳ���
*   Return:             FSK_RESULT
*   Created:	        2014:09:23  18:35
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_rx( INOUT Audio_Handle hFsk, IN AudioBuf *pAudioSrc, OUT UWORD8 *pFskOutput, OUT int *pOutLen );

/********************************************************************
*	Funcname: 	    	fsk_tx
*	Purpose:	fsk�����㷨�����ڴ���Ч�ʿ��ǣ��շ�����δ��У�飬���������ϲ�Э���м���У���ֶΣ�
*   InputParam:   INOUT Audio_Handle hFsk
*                    IN WORD8       *pFskInput:���뷢������
*                    IN int          inLen    :���뷢�������ֽ�������Чֵ��1 - 32767
*   OutputParam:    OUT AudioBuf    *pAudioDst:�����Ƶ�ṹ��ָ��
*   Return:             FSK_RESULT
*   Created:	        2014:09:23  18:42
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_tx( INOUT Audio_Handle hFsk, IN UWORD8 *pFskInput, IN int inLen, OUT AudioBuf *pAudioDst );

/********************************************************************
*	Funcname: 	    	fsk_deInit
*	Purpose:	fsk�㷨�ڴ�����
*   InputParam:   INOUT Audio_Handle *phFsk
*   OutputParam:        
*   Return:             FSK_RESULT
*   Created:	        2014:09:23  18:31
*   Revision Record:    
*********************************************************************/
FSK_API FSK_RESULT fsk_deInit( INOUT Audio_Handle *phFsk );

#ifdef __cplusplus
}
#endif

#endif
